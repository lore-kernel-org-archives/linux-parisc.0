From: "Peter E. Popovich" <peter@popovich.net>
Subject: Re: [parisc-linux] 712/60, 712/80, serial console, firmware update,
	"dagger cards"
Date: Sat, 17 Jul 2004 01:36:33 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0407170128540.7555@kani.popovich.net>
References: <Pine.LNX.4.60.0407161743420.32264@kani.popovich.net>
	<20040717010407.25b64a24@Tatooine.r3z0>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Thibaut VARENE <varenet@esiee.fr>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040717010407.25b64a24@Tatooine.r3z0>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 17 Jul 2004, Thibaut VARENE wrote:
>> then i tried to use the serial console hack described at:
>> http://www.pateam.org/parisc-linux-boot/PA-RISC-Linux-Boot-HOWTO/consoles.html
>>
>> something went wrong, because now, the system doesn't boot.  it appears
>> to be dumping 0xNNNN diagnostic codes out the serial port.
>
> This could be normal ;)
>
> Wait a bit, and among the 0xNNN you might eventually see "Starting boot
> process" at some point. Then you'll saved. If you followed EXACTLY what
> was said in the howto, it should work. We've got several of these tiny
> beasts here booted in serial console (even our MySQL server is a 712!) ;)
>
> Besides, it is mentionned that this is a hat trick, and
> therefore,_dangerous_...

i'm fairly sure i did it letter-perfect, but i'm human, so i may not have.

waiting a bit doesn't seem to be the issue.  i've waited 10+ minutes, 
multiple times.  the output appears to be consistent:

0x04.1081
0x04.1080
0x04.1082
0x04.1086
0x04.1087
0x04.108A
0x04.108B
0x04.108C
0x04.1083
0x04.10D1
0x04.10D2
0x04.2090
0x04.2091
0x04.209F
0x04.2096
0x04.2094
0x04.2095
0x06.C201
0x04.10DB   <--- there's a pause here
0x04.10D7
0x04.10D8
0x04.2097
0x04.2098
0x04.2099
0x04.209A
0x04.209B
0x04.1091
0x04.1092
0x04.1093
0x04.1094
0x04.1095
0x04.1096
0x04.1090
0x04.108D
0x04.10D4
0x04.10D9
0x04.4080
0x04.4081
0x04.4082
0x04.8300
0x04.8322
0x04.8326
0x04.8328
0x04.832A
0x04.832B
0x04.832C
0x04.8321
0x04.8301
0x02.1009

it'd be interesting to see what it *should* look like.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
