From: "H. Peter Anvin" <hpa@zytor.com>
Subject: [parisc-linux] Re: [klibc] [PATCH] vfork() for parisc
Date: Tue, 25 Jul 2006 15:28:32 -0700
Message-ID: <44C69B10.7050203@zytor.com>
References: <20060724031438.GB5542@athena.road.mcmartin.ca>
	<44C693EA.5080704@zytor.com>
	<20060725221524.GA5625@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: klibc@zytor.com,
 parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060725221524.GA5625@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Kyle McMartin wrote:
> On Tue, Jul 25, 2006 at 02:58:02PM -0700, H. Peter Anvin wrote:
>> Kyle McMartin wrote:
>>> Implement "pid_t vfork(void)" for parisc.
>>>
>> Dumb question... where does %r20 get set?  This isn't invoked by a 
>> system call stub; it's the entire function.
>>
> 
> Oh. Nowhere then. We can set it in the branch delay slot.
> 

Cool.  Could you do a "make test" and run usr/klibc/tests/vfork to verify?

(For completeness sake: klibc supports generating stubs for alternate 
system call conventions by using the following syntax in SYSCALLS.def:

returntype syscall@convention(args...);

The string "convention" gets passed to sysstub.ph; on most architectures 
it simply replaces the string "common" in "__syscall_common".

However, there isn't exactly any point to do that for single-shot system 
  call conventions, like vfork() and pipe() on many platforms.

	-hpa
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
