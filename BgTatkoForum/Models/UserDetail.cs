//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BgTatkoForum.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class UserDetail
    {
        public string UserId { get; set; }
        public byte[] Avatar { get; set; }
        public System.DateTime DateRegistered { get; set; }
        public string About { get; set; }
        public string WebSite { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
    
        public virtual User User { get; set; }
    }
}
