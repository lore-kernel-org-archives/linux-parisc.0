From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-15?Q?Re=3A=20copy=5Fuser=5Fpage=5Fasm=20suggested=2064bit=20improvment=20=5BWas=3A=09=5Bparisc=2Dlinux=5D=20clear=20user=20page=20test=5D?=
Date: Wed, 12 Jan 2005 16:32:22 +0100
Message-ID: <41DE4A3A00001BE4@mail-1-bnl.tiscali.it>
References: <200501120752.07206.mszick@wolfbutter.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: "Michael S. Zick" <mszick@wolfbutter.com>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200501120752.07206.mszick@wolfbutter.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

[...]
> > 
> Design seems to be drifting in that general direction.
> 
> See: change log on 2.6.11-rc1
> 
> More details at:
> <http://seclists.org/lists/linux-kernel/2005/Jan/0888.html>
> 
The last v4 release thread start here:
<http://seclists.org/lists/linux-kernel/2005/Jan/2931.html>
and also 
<http://www.gelato.unsw.edu.au/linux-ia64/0501/12468.html>

I tried to applying those patch but I do have miss against which kernel t=
his
patch was build: a big hunk of patch [2/4] failled :-(
Having a quick look is supposed to rename severall function in mm/page_al=
loc.c
as page_order() into page_zorder() but I didn't find it and not more in t=
he
vanilla 2.6.10?

Joel

-------------------------------------------------------------------------=
--
Tiscali solde! 1 mois et activation Gratuits, modem =E0 9,99=80
http://reg.tiscali.be/adsl/default.asp?lg=3DFR



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
