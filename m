From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] K460
Date: Fri, 21 May 2004 08:43:48 +0000
Message-ID: <40ADC144.30101@tiscali.be>
References: <000801c43e63$b0e63da0$f6e40718@mxdogxp>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: mxdog <mxdog@comcast.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <000801c43e63$b0e63da0$f6e40718@mxdogxp>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello,

mxdog wrote:
> Hello
> 
> I'm trying to make linux work on my K460 box. I'm an old dog ...a.k.a. z80 days (8 bit)...so I'm not a kernel hacker, and don't want to be, but I can write code if I'm absolutely forced to ( takes lot time learn the machines heart and soul...got past that with my commodore 64 and a few others) ..I have 20-9 gig drives on this machine that I would like to use for web page serving in the company,ftp ...mostly me...and inter-company and file storage/backup,email..possibly other stuff...like process control...maybe point of sale....the thing is this size company and the price we got the machine for cant beat it..this will be a perfect platform ( linux) and the hardware and software too is cheap ..LOL deliver us from evil...a.k.a. windows.
> 

Welcome, I am the same old dog so I try to contribute with test as relevant as possible to help hackers as afar as I can ;)

> OK LET ME MAKE A STATEMENT: I HATE HP-UX : been 5 weeks night and day trying to make that OS talk to me and make it do something useful  and all I ever seem to do is reinstall the system...ok enough said on that!
> 
umm we had in production some K4x0 (3 or 4) running hpux 10.20 without pb even with fc addon card on core io ;). (unfortunately I 
don't have time to take the opportunity to test linux with this box ;( )

> I can live in linux....been in there since 386 5.2 redhat....tried to make company I worked for go that way in 1985(Unix) ...but Bill got in the way...talent stealing shit he is. Ok enough politics.
> 
> here is my problem: I really have no idea what I'm supposed to download,make CD's and make my box work. hppa is supposed to be supported in 3.0 but I spend 3 days downloading all 7 CD's (ISO's) 3.0r2 and first load got kernel error...no detail..next email...
> 
Unfortunately the woody cd 3.0r2 was not well tested and there are many reports of install failure.
So generally it is recommended to try the new sarge debian-install netinstall-cd available at:
<http://cdimage.debian.org/pub/cdimage-testing/sarge_d-i/hppa/current/sarge-hppa-netinst.iso>

or the previous netinstall cd:
<http://www.pateam.org/cd-images/testing/>

And the FAQ page: <http://www.parisc-linux.org/faq/index.html> explain in detail how to burn, check and boot your cd ;)
(iirc there are also special recommandation for K model and ttyB0 aka pdc_console usage)

> this is the site that does this...I need help, you guys need an idiots guide to what works on a k box ( LOL or any  box)....bad joke.....what version etc.....hell I took 2 hours tonight for I found a doc that said the PDC isn't in the file name anymore.
> 
> kernel crash is best I can do from memory: KERNEL FAULT: CODE26 .....stack something does not point to c30.....and then a kernel dump
> sorry this isn't a bug report just a cry for help I'll do much better if I get a response
>
umm iirc CODE26 is a data page fault (new kernels available on sarge and pateam iso are more recent so certainly fix the pb?)

hth,
	Joel

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
