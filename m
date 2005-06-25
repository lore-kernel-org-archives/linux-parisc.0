From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Sat, 25 Jun 2005 08:29:56 +0000
Message-ID: <42BD1604.4050403@tiscali.be>
References: <200506250646.j5P6kN2H029175@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200506250646.j5P6kN2H029175@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



John David Anglin wrote:
>>mmm do I well understand that to force gcc to on;y use fr4-f5 and fr22-fr26
>>(as do __muldi3), I had to use option:
>>cflags-y        += -mfixed-range=fr6-fr21,fr27-fr28
> 
> 
> Close, I used the change below.
mmm I definetely have to go back to elementary school (4 + 28 -1 = 31 and not 28, my bad !!!)

>  This seems to build and check ok.
Ok I will try to rebuild libgcc2 and kernel with same options.

Btw 2.6.12-pa1 already build and boot fine with above mentioned options.
Anyway still hanging after 44 min of stress test.

So imho 2 first thinks to do:
	o apply the right 'fixed-range' option
	o apply 2.6.12.1 patch

> I don't know if it would be possible to cut back another register or not.
> If I was going to try, I would add fr26 to the fixed list.
> 
If still not work, the 3rd test I will do ;-)

I will advise.

Thanks again,
     Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
