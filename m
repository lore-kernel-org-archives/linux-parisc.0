From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] [testers wanted] cleanup early console setup
Date: Mon, 14 Feb 2005 02:12:36 +0000
Message-ID: <20050214021236.GA29917@parcelfarce.linux.theplanet.co.uk>
References: <20050211223525.GH2277@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050211223525.GH2277@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Feb 11, 2005 at 02:35:25PM -0800, Randolph Chung wrote:
> Especially interesting would be something that uses non-8250 consoles,
> such as E/K class systems that use the serial mux console. I suspect
> some changes are needed there. If you can test on such a system, and see
> some problems [*], please let me know. likely we will need to move the
> register_console() call from mux_probe() into a separate initcall.
> 
> [*] during startup, the console print messages should show up regularly,
> and only once. symptoms of problems are if your console prints pause
> for a long time, or if you start seeing each line printed twice.

My comments in >>> <<<, this is the boot log from Knapps

Linux version 2.6.11-rc3-pa5 (willy@palinux) (gcc version 3.3.5 (Debian 1:3.3.5-5)) #9 Sun Feb 13 18:53:41 MST 2005
FP[0] enabled: Rev 0 Model 14
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 000058f0 00000491 00000000 00000002 53ad0a91 100000f1 00000008 000000b2 000000b2
vers  00000201
CPUID vers 14 rev 5 (0x000001c5)
model 9000/889/K460
Total Memory: 1920 Mb
Built 1 zonelists
Kernel command line: HOME=/ root=/dev/sda3 console=ttyB0 TERM=vt102 palo_kernel=0/vmlinux
PID hash table entries: 4096 (order: 12, 65536 bytes)
Switching from PDC console
>>> Long pause here <<<
Linux version 2.6.11-rc3-pa5 (willy@palinux) (gcc version 3.3.5 (Debian 1:3.3.5-5)) #9 Sun Feb 13 18:53:41 MST 2005
FP[0] enabled: Rev 0 Model 14
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 000058f0 00000491 00000000 00000002 53ad0a91 100000f1 00000008 000000b2 000000b2
vers  00000201
CPUID vers 14 rev 5 (0x000001c5)
model 9000/889/K460
Total Memory: 1920 Mb
Built 1 zonelists
Kernel command line: HOME=/ root=/dev/sda3 console=ttyB0 TERM=vt102 palo_kernel=0/vmlinux
PID hash table entries: 4096 (order: 12, 65536 bytes)
Switching from PDC console
Console: colour dummy device 160x64
Dentry cache hash table entries: 262144 (order: 8, 1048576 bytes)
Inode-cache hash table entries: 131072 (order: 7, 524288 bytes)
Memory: 1966080k available
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
NET: Registered protocol family 16
>>>lots more here<<<
Serial mux driver (8 ports) Revision: 0.3
ttyB0 at MMIO 0xf1900800 (polled) is a Mux
>>>etc<<<
Debian GNU/Linux 3.1 knapps ttyB0

knapps login: root
Password: 
Last login: Mon Feb 14 01:56:30 2005 on ttyB0
Linux knapps 2.6.11-rc3-pa5 #9 Sun Feb 13 18:53:41 MST 2005 parisc GNU/Linux


-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
