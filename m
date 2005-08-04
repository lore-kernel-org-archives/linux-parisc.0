From: Clemens Ladisch <clemens@ladisch.de>
Subject: Re: [parisc-linux] [Alsa-devel] [PATCH] Support for AD1889 PCI
	Soundchip
Date: Thu, 4 Aug 2005 15:30:45 +0200 (METDST)
Message-ID: <Pine.HPX.4.33n.0508041503020.11474-100000__8051.72438635982$1416623881$gmane$org@studcom.urz.uni-halle.de>
References: <20050729211634.566f5343@Tatooine.r3z0>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
Cc: alsa-devel@lists.sourceforge.net,
 parisc-linux@lists.parisc-linux.org,
 kyle@parisc-linux.org
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050729211634.566f5343@Tatooine.r3z0>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Thibaut VARENE wrote:
> Attached is a patch against 2.6.13-rc4 providing support for Analog
> Devices AD1889 PCI Sound chip, which is especially found on some HP
> PA-RISC machines.

I don't actually have this hardware :-), but the docs don't mention
any dependency between the count registers (BC, CC) and the interrupt
count registers (IC, IB).

So wouldn't it be possible to put the ALSA buffer size into the count
registers and the ALSA period size into the interrupt count registers?

This would make the interrupt handler much simpler, as it wouldn't
have to reprogram any registers.  And it would solve the problem that
the DMA accesses for one period go beyond the buffer when the number
of periods per buffer is not an integer.


Regards,
Clemens

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
