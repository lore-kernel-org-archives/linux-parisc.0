From: Oliver Grafe <heiner991@gmx.de>
Subject: Re: [parisc-linux] B1000 freeze after sym0:
Date: Wed, 14 Dec 2005 18:30:36 +0100
Message-ID: <20051214183036.5960e851.heiner991@gmx.de>
References: <17461.1134562581@www66.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <17461.1134562581@www66.gmx.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi!

Heiner991@gmx.de wrote:
> I installed Debian 3.1_r0 on my B1000, but now i got problems at boot.
> The machine hangs after the following message:
> 
> [...]
> NET: Registered protocol family 1
> sym0: <896> rev 0x4 at pci 0000:00:0f.0 irq 65
> sym0: No NVRAM, ID 7, Fast-40, SE, parity checking
> [...]

I "solved" it: I disconnected keyboard, mice and monitor, now the
machine boots nicely and i get access via ssh. It's the first time i see
a connected/disconnected USB-Keyboard got something to do with a
SCSI driver, but it "works for me" now.

If someone is still interested in really solving this problem i'm glad
to give further informations or compiling kernels etc...


Greetings,
Oliver

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
