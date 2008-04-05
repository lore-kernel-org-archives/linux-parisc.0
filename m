From: rubisher <rubisher@scarlet.be>
Subject: Re: [alpha, hppa] GCC-4.3 as the default compilers for lenny?
Date: Sat, 05 Apr 2008 20:07:34 +0000
Message-ID: <47F7DC06.9010702@scarlet.be>
References: <18405.27903.317733.531002@gargle.gargle.HOWL> <119aab440803221402w2bfe5a7le9499e4eb6e0e3c1@mail.gmail.com> <47E583EA.7000006@aurel32.net> <119aab440803251542l4d86ef9bvaf8163e940e1ab35@mail.gmail.com> <20080326162035.GB24944@colo.lackof.org> <20080328055652.GA24649@colo.lackof.org> <47EE894C.4010004@scarlet.be> <20080405181719.GB19742@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: "Carlos O'Donell" <carlos@systemhalted.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Matthias Klose <doko@cs.tu-berlin.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
	debian-release@lists.debian.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080405181719.GB19742@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Grant Grundler wrote:
> On Sat, Mar 29, 2008 at 06:24:12PM +0000, rubisher wrote:
> ...
>>> I looked at gcc-43 build output to check warnings related to networking
>>> as suggest by John David Anglin.
> ...
>> That remember me that when I discover those new warnings with gcc-4.2 
>> <http://article.gmane.org/gmane.linux.ports.parisc/70>
>> "discards qualifiers from pointer target type", they disapeared with 
>> gcc-4.3
> 
> I saw that but don't know what it's about.
> 
The answer of Matthew seems to work ;-)

>> and btw this nic wasn't working anymore (no ping no ssh, ...) 
>> even thought the kernel was booting. Unfortunately, I didn't have time to 
>> investigate in more details (and it wasn't question to use gcc-4.3 as new 
>> default), sorry. If you compare your kernel build output with gcc-4.2 and 
>> 4.3 do you also notice this differences?
> 
> By "build output" do you mean the binary (e.g. dot-o files) or log of what
> was compiled and which warnings were emitted?
> 
Well, my understanding was that you compared a log file of a build with gcc-4.2 with the log file of the build of same src 
with gcc-4.3. That's what I did in fact but I was so busy this week that I couldn't post the results. Sorry, I will be off 
next week too, so will try to do when I will be back next Apr 14 ;-)

hth,
	r.

> thanks
> grant
> 
> 

