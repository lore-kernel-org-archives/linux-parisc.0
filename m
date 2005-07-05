From: Max Grabert <parisc@gmail.com>
Subject: Re: [parisc-linux] Help wanted: Getting Matrox Mystique to run on
	HPPA B2000
Date: Tue, 5 Jul 2005 17:07:46 +0100
Message-ID: <e6eae02905070509071c271661@mail.gmail.com>
References: <5.1.1.6.1.20050705220226.02abcec0@pop.singnet.com.sg>
	<20050705165159.0953c3ac.gmsoft@gentoo.org>
Reply-To: Max Grabert <parisc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org
To: Guy Martin <gmsoft@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050705165159.0953c3ac.gmsoft@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 05/07/05, Guy Martin <gmsoft@gentoo.org> wrote:
>=20
> What about
> video=3Dmatroxfb:vesa:0x111,depth:16,mem:4,noaccel,init console=3Dtty0
> passed to the kernel or something which best correspond to your vga card =
?
>=20
> Mine is this :
> 0000:02:03.0 VGA compatible controller: Matrox Graphics, Inc. MGA 1064SG =
[Mystique] (rev 02)
> and it works fine.

I have a Millenium (I), in my /etc/palo.conf I have
"video=3Dmatroxfb:nomtrr:init:vesa:0x11B:mem:8"

works fine here, too.

   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
