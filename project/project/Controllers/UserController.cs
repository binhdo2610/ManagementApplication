﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using project.Data;
using project.Models;
using project.Models.DTO;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;


namespace project.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]

    public class UserController : ControllerBase
    {//Thêm xóa sửa 
        private readonly Datacontext _context;
        private readonly IConfiguration configuration;

        public UserController(Datacontext context,IConfiguration configuration)
        {
            _context = context;
            this.configuration = configuration;
        }
        [HttpPost("Login")]
        public async Task<ActionResult<List<User>>> Login(DTOLogin request)
        {
            var user = await _context.Users.SingleOrDefaultAsync(u => u.Username == request.Username);
            if (user == null)
            {
                return Unauthorized();
            }
            if (request.Password != user.Password)
            {
                return NotFound("Sai password ");
            }
          
            string token = CreateToken(user);
            return Ok(token);
        }
        [HttpPost("Register")]
        public async Task<ActionResult<List<User>>> AddUser(UserDTO userDTO)

        {


            var user = new User
            {
                Username = userDTO.Username,
                Firstname = userDTO.Firstname,
                Lastname = userDTO.Lastname,
                Email = userDTO.Email,
                Password = userDTO.Password,

            };
            _context.Users.Add(user);

            await _context.SaveChangesAsync();
            return Ok(await _context.Users.ToListAsync());
        }
        
        [HttpGet]
        public async Task<ActionResult<List<User>>> GetAllUser()
        {
            var users = await _context.Users.ToListAsync();
            return Ok(users);
        }
       /* [Authorize]*/
        [HttpPut]
        public async Task<ActionResult<List<User>>> UpdatedUser(DTOupdate updatedUser )
        {
            
            var user = await _context.Users.FindAsync(updatedUser.Id);
            if(user == null)
            {
                return NotFound();
            }
          
            user.Username = updatedUser.Username;
            user.Email = updatedUser.Email;
            user.Firstname = updatedUser.Firstname;
            user.Lastname = updatedUser.Lastname;
            user.Password = updatedUser.Password;

            await _context.SaveChangesAsync();
            return Ok(await _context.Users.ToListAsync());
        }
        [HttpDelete]
        public async Task<ActionResult<List<User>>> RemoveUser (int id )
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null) {
                return NotFound();
            }
            _context.Users.Remove(user);
            _context.SaveChanges();
            return Ok(await _context.Users.ToListAsync());
        }


        //
       /* private void CreatePasswordHash(string password, out byte[] passwordHash, out byte[] passwordSalt)
        {
            using (var hmac = new HMACSHA512())
            {
                passwordSalt = hmac.Key;
                passwordHash =hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
            }
        }*/
        private string CreateToken(User user)
        {
            List<Claim> claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, user.Username)
            };
           /* var key = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(configuration.GetSection("AppSettings:Token").Value));
            var cred = new SigningCredentials(key, SecurityAlgorithms.HmacSha512Signature);*/
            var token = new JwtSecurityToken(
                claims:claims,
                expires:DateTime.Now.AddDays(1),
                signingCredentials: new SigningCredentials(new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration.GetSection("AppSettings:Token").Value)), SecurityAlgorithms.HmacSha256));
            var jwt =new JwtSecurityTokenHandler().WriteToken(token);

            return jwt;
        }
    }
}