From: Joel Soete <joel.soete@tiscali.be>
Subject: [parisc-linux] ATY RAGE XL progress or Dino gscpci bridge pb?[was: Re: HP C180 video
 card]
Date: Sat, 21 Jun 2003 14:24:41 +0000
Message-ID: <3EF46AA9.7040703__26539.6930314184$1416622530$gmane$org@tiscali.be>
References: <03f301c3309e$f0c78740$d908f3d8@uvsolutions> <20030613043356.GA7265@dsl2.external.hp.com> <3EEC9AC2.5070106@tiscali.be> <20030615161948.GA12995@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>,
	debian-hppa@lists.debian.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030615161948.GA12995@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Grant,

Grant Grundler wrote:

>On Sun, Jun 15, 2003 at 04:11:46PM +0000, Joel Soete wrote:
>  
>
>>I tried to use a "PGX64 alias Rage xl " pluged in the first slot of my 
>>b180L. It seems to be well supported by kernel 2.4.21 (modeprobe 
>>ati128fb; # modules were well loaded).
>>    
>>
>
>cool - that's a good first step. I don't know where to go from there.
>  
>
Hmm in fact I obtain better results with atyfb + "Mach64 CT/VT/GT/LT 
(incl. 3D RAGE) support (NEW)";
this time I obtain such message for kernel advising me that 'atyfb' 
modules is loaded and some other info collected from the device itself.

>>But no success to make XFree86 
>>works (fbset /dev/fb0 not found)
>>    
>>
I also reach to get (not yet changing) default setup with "fbset -fb 
/dev/fb1" :-)
But not yet find the way to setup X using /dev/fb1 in place of fb0 ;-( ?

Let see later because my very problem is there:
a) if I rmmod atyfb the system crashes
b) if I do not include "Generic sti fb" in the config of my kernel, when 
I insmod atyfb the system crashes also
c) if I try to use Equinox serial mux (8P) (an oem HP product) module 
(with our without your patch Grant) the system crashes also?

The system is a B180 model using Dino GSCPCI bridge and in the two cases 
(even if messages are a bit different) the TOC shows always a pb on this 
bus (the analyse of toc after the crash of insmod eqnx point out a pb in 
timer_? routine). And in fact I figure out that I never have to use this 
bridge for another card?
Is somebody else used it successfuly or could it be broken?

Thanks again for any help,
    Joel
