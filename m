From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Thu, 05 May 2005 16:20:22 +0000
Message-ID: <427A47C6.7060400@tiscali.be>
References: <200505022046.j42KkQnh000694@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: lamont@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200505022046.j42KkQnh000694@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Dave,

Come back to expect pb:
	o I just grab dpkg src and while I rebuild it localy I noticed that:
./configure [snip] --enable-threads
[snip]
checking for building with threads... configure: WARNING: Expect is not fully thread-enabled.  Although significant work has been 
done towards that goal, it is not complete.  Continue compiling at your own risk.
no (default)
[snip]
	? do you also used this '--enable-threads' options

	o I also grab the latest 5.43.0 release and btw lfs recommended the patch: expect-5.43.0-spawn-1.patch
	  <http://lfs-matrix.net/lfs/view/development/chapter05/expect.html>
	? do you already test it?

Thanks,
	Joel

John David Anglin wrote:
>>>>  IAOQ[0]: sys_poll+0x274/0x298
>>>>  IAOQ[1]: sys_poll+0x278/0x298
>>>>  RP(r2): sys_poll+0x17c/0x298
>>>>
>>>>  # disasm 0ed5d240
>>>>    0:   0e d5 d2 40     sth r21,0(sr3,r22)
>>>
>>>Where did this address come from?  IAOQ[0] = 0x101b22e4.
>>
>>Sorry, this is the faulting instruction.  However, this isn't much help.
>>This isn't GCC code (GCC doesn't generate code using sr3).  It's part of
>>a syscall asm.  The value in sr3 seems wierd.
> 
> 
> The problem code is in fs/select.c:
> 
>                 for (j=0; j < walk->len; j++, ufds++) {
> 			if(__put_user(fds[j].revents, &ufds->revents))
> 				goto out_fds;
> 		}
> 
> The sth is in the __put_user code.
> 
> Dave
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
