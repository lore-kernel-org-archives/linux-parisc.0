From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] kernel module relocation bug
Date: Mon, 29 Nov 2004 18:46:08 -0500 (EST)
Message-ID: <200411292346.iATNk8hq003726@hiauly1.hia.nrc.ca>
References: <200411292251.iATMp5i2007453@arbas.nms.ulrich-teichert.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: krypton@ulrich-teichert.org,
 James.Bottomley@SteelEye.com,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: krypton@ulrich-teichert.org (Ulrich Teichert)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200411292251.iATMp5i2007453@arbas.nms.ulrich-teichert.org> from
	"Ulrich Teichert" at Nov 29, 2004 05:51:05 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Ah, then most likely, my toolchain is too old. I'm using debian woody =

Yes.

> What ld/gas/gcc versions would you recommend? Do I need extra patches?

Binutils 2.15, gcc 3.3.4.  No.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
