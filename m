From: Helge Deller <deller@gmx.de>
Subject: Re: Git head doesn't boot on A500
Date: Sun, 18 May 2008 18:19:52 +0200
Message-ID: <48305728.20403@gmx.de>
References: <7d01f9f00805170620t30630519h4890037400c62fb5@mail.gmail.com> <20080517152623.GA26649@colo.lackof.org> <7d01f9f00805171752r4eb8ee5nbfee8f832677f792@mail.gmail.com> <20080518071342.GB26649@colo.lackof.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060402080201090608000109"
Cc: Thibaut VARENE <T-Bone@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080518071342.GB26649@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------060402080201090608000109
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Grant Grundler wrote:
> On Sun, May 18, 2008 at 02:52:00AM +0200, Thibaut VARENE wrote:
>> On Sat, May 17, 2008 at 5:26 PM, Grant Grundler
>> <grundler@parisc-linux.org> wrote:
>>> On Sat, May 17, 2008 at 03:20:46PM +0200, Thibaut VARENE wrote:
>>>> Hi pa-ckers
>>>>
>>>> Just a quick failure report, I tested git head + jejb's zonelist patch
>>>> on my A500 (gcc-4.2) and it hpmc'd the box (afaict) very early during
>>>> bootup. I'll dig that more ASAP.
>> Kyle eventually spotted the offending patch:
>> http://git.kernel.org/?p=linux/kernel/git/kyle/parisc-2.6.git;a=commitdiff;h=bd3bb8c15b9a80dbddfb7905b237a4a11a4725b4;hp=492c2e476eac010962850006c49df326919b284c
>>
>> Out of this patch, the only two non-offending hunks are:
>> diff --git a/arch/parisc/kernel/head.S b/arch/parisc/kernel/head.S
>> index ec2482d..5680a2c 100644 (file)
>> --- a/arch/parisc/kernel/head.S
>> +++ b/arch/parisc/kernel/head.S
>> @@ -32,7 +32,7 @@ ENTRY(boot_args)
>>         .word 0 /* arg3 */
>>  END(boot_args)
>>
>> -       .section .text.head
>> +       __HEAD
>>         .align  4
>>         .import init_thread_union,data
>>         .import fault_vector_20,code    /* IVA parisc 2.0 32 bit */
> 
> So I don't understand how __HEAD works...and all the other arches are
> using ".text.head" (not .head.text) which has corresponding "code" in
> their vmlinux.lds.  Could someone kindly point out how .head.text 
> works for parisc?

Yeah, my fault (no idea why it worked for me???).

I see two options:
1) revert my patch (gets to linker warnings and have to build up a new 
patch, ideally adding a section for .text.head to vmlinux.lds.S),
2) apply the attached patch.

Opinions?

Helge

--------------060402080201090608000109
Content-Type: text/plain;
 name="t66"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="t66"

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 50b4a3a..2e516b8 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -50,6 +50,7 @@ SECTIONS
 
 	_text = .;		/* Text and read-only data */
 	.text ALIGN(16) : {
+		HEAD_TEXT
 		TEXT_TEXT
 		SCHED_TEXT
 		LOCK_TEXT

--------------060402080201090608000109--
