From: Helge Deller <deller@gmx.de>
Subject: Re: Peculiar X Issues
Date: Wed, 2 Jun 2004 20:55:57 +0200
Message-ID: <200406022056.00125.deller__16502.0029795871$1416623465$gmane$org@gmx.de>
References: <1086184964.d661bd9cbrianbarber@myrealbox.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: parisc-linux@lists.parisc-linux.org
To: debian-hppa@lists.debian.org,
 brianbarber@linux.ca
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <1086184964.d661bd9cbrianbarber@myrealbox.com>
Resent-Message-ID: <eKg-hC.A.IXB.TLivAB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: <http://lists.debian.org/debian-hppa/>

On Wednesday 02 June 2004 16:02, Brian Barber wrote:
> 1) I just installed a new Startech 411 KVM switch last night and now my mouse does not work.  It works with exactly the same monitor, keyboard and mouse, through a Cybex (now Avocent) 2-port KVM and when directly connected.  Any suggestions?

The input drivers in 2.6 still has some problems with this kind of switches. Even on i386 (could you test it on such a machine with the same kernel?).
Else I have right now no other ideas.

helge


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
