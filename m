From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Missing syscalls in 2.6.30-rc4
Date: Sat, 2 May 2009 10:16:18 -0400
Message-ID: <20090502141618.GB28342@bombadil.infradead.org>
References: <20090502012823.955BA4E9F@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090502012823.955BA4E9F@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, May 01, 2009 at 09:28:19PM -0400, John David Anglin wrote:
> The following syscalls aren't wired up:
> 
> <stdin>:1421:2: warning: #warning syscall preadv not implemented
> <stdin>:1425:2: warning: #warning syscall pwritev not implemented
> 

Yeah, I committed this to my tracehook branch by mistake, sorry. I'll
sort out what's in git this weekend, as I've been busier than expected
with RHT stuff this week.

--Kyle
