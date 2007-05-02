From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [parisc-linux] unaligned access using bash on glibc 2.5
Date: Wed, 02 May 2007 17:36:37 +0200
Message-ID: <4638B005.60902__27504.1447174319$1416624344$gmane$org@aurel32.net>
References: <200705021516.l42FGCMT015600@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200705021516.l42FGCMT015600@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

John David Anglin a écrit :
>> On Wed, May 02, 2007 at 11:38:51AM +0200, Aurelien Jarno wrote:
>>> Please find the reduced testcase below. When the value is assigned to
>>> __libc_errno, the value of r19 has been overrided by the call to free().
>>>
>> And a smaller one:
>>
>>
>> extern __thread int __libc_errno __attribute__ ((tls_model ("initial-exec")));
> 
> This is a bug in __attribute__ ((tls_model ("initial-exec"))).  It
> doesn't express that it uses r19.  As a result, GCC is free to optimize
> the save and restore of r19 across the call to free away.
> 
> The same is true of the asm.

What would be the correct way to express that?

-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
