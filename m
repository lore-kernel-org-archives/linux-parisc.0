From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Bizzare Bash behavior (Bug? 2.6.14.3-pa0 SMP)
Date: Sat, 17 Dec 2005 19:49:50 +0000
Message-ID: <43A46BDE.2090901@tiscali.be>
References: <a6b35aa6481f.a6481fa6b35a@shaw.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Keven Tipping <bytelogix@shaw.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <a6b35aa6481f.a6481fa6b35a@shaw.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Keven Tipping wrote:
> Greetings to all!
> 
> I've now got the following quirk on my HPPA box.
> 
> This problem is only evident when running SMP, as it appears. The problem doesn't happen under a Uniprocessor kernel.
> 
> SMP, works great otherwise. No segfaults or panics related to SMP sofar.
> 
> What happens here is that Bash doesn't "return" after a command, ie, my prompt dissapears and never comes back. Doing something as trivial as uname or ls, my computer# Bash prompt never re-appears after the program has finished sending its output (ie, after the directory listing of ls or the output to terminal from uname).
> 
> This is using /dev/ttyB0 as the terminal, as specified under /etc/inittab. Agetty spawns and works as expected.
> 
> Now, I can SSH into the box just fine after the Bash prompt has dissapeared under the serial console. I can kill Bash from this SSH terminal and Agetty respawns on ttyB0, and I can repeat this process indefinately. SSH works absolutely great, no problems with a SSH connection at all.
> 
> This only happens after running "some" command. If I let Bash idle, and come back, it still accepts input as normal, so its not hanging after a given amount of time. Its just after executing programs.
> 
> Bash works under SSH, so I can't see what the problem is here or why SMP seems to cause it. Dmesg shows no errors. No kernel panics or anything else. This only occurs on ttyB0.
> 
> I've turned off all color for the Bash & LS Commands on by default under Gentoo, same results, so the colored console/serial terminal has nothing to do with it (and besides, it makes no difference as it works with color regardless under a Uniproc kernel).
> 
> Any ideas?
> 
On my d380, it's a debian testing using by default getty:
# more /etc/inittab
[...]
# Example how to put a getty on a serial line (for a terminal)
#
T0:23:respawn:/sbin/getty -L ttyS0 9600 vt102
#T1:23:respawn:/sbin/getty -L ttyS1 9600 vt102
T2:23:respawn:/sbin/getty -L ttyB0 9600 vt102
[...]

supplied by:
# dpkg -S /sbin/getty
util-linux: /sbin/getty
# dpkg -l util-linux
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
||/ Name                        Version                     Description
+++-===========================-===========================-======================================================================
ii  util-linux                  2.12p-8                     Miscellaneous system utilities

and runing bash-3.0:
# dpkg -l bash
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
||/ Name                        Version                     Description
+++-===========================-===========================-======================================================================
ii  bash                        3.0-17                      The GNU Bourne Again SHell

and didn't have yet encounter the pb you decribe, though.

Hth,
	Joel

PS: oth, I encounter a weird pb with init (iirc a debian default) supplied by:
# which init
/sbin/init
# dpkg -S /sbin/init
sysvinit: /sbin/init
# dpkg -l sysvinit
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
||/ Name                        Version                     Description
+++-===========================-===========================-======================================================================
ii  sysvinit                    2.86.ds1-4                  System-V like init

May I ask you to check which init Gentoo use by default?
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
