From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: 2.6.10-rc1-pa16 still panic on c110 [WAS: [parisc-linux] c110
	panic when try to boot 2.6.10-rc1-pa11?]
Date: Sun, 21 Nov 2004 14:40:00 -0700
Message-ID: <20041121214000.GC1477@colo.lackof.org>
References: <41966398.4070303@tiscali.be> <419FAAF4.4030608@tiscali.be>
	<20041121000403.GF11503@colo.lackof.org>
	<41A0BFD2.4020205@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: List Parisc <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41A0BFD2.4020205@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Nov 21, 2004 at 04:18:26PM +0000, Joel Soete wrote:
> That works far better: no more panic at boot time :))

good. I think the other problems you are have are either real HW problems,
bugs in the driver or bugs in the hard disk firmware.
You can rule out some of the hard disk firmware bugs by checking for
newer versions of the firmware either at HP's site (URL
is in the parisc-linux FAQ) or disk vendor's site.

Real HW might be "fixed" by a "low level format".
See scsiformat in scsitools package.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
