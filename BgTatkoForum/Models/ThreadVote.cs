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
    
    public partial class ThreadVote
    {
        public int ThreadVoteId { get; set; }
        public string UserId { get; set; }
        public int ThreadId { get; set; }
    
        public virtual Thread Thread { get; set; }
        public virtual User User { get; set; }
    }
}