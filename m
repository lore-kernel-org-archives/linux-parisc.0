Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA04769
	for <parisc-linux@puffin.external.hp.com>; Mon, 10 Jul 2000 08:12:07 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 10 Jul 2000 14:13:36 -0000
To: "Brian S. Julin" <bri@mojo.calyx.net>
Cc: Matt Taggart <taggart@carmen.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] e2fsprogs available
References: <Pine.BSO.4.21.0007091433510.14827-100000@mojo.calyx.net>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 10 Jul 2000 09:59:07 -0400
In-Reply-To: "Brian S. Julin"'s message of "Sun, 9 Jul 2000 14:42:59 -0400 (EDT)"
Message-ID: <87zonqccic.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

"Brian S. Julin" <bri@mojo.calyx.net> writes:

> Also, in case anyone was wondering, the cross-compiler problems
> from ALPHA seem to have been fixed.  I've booted an ALPHA-compiled kernel.

Cool.

> GCC won't build a native, complains about a missing nss symbol.

This is well-known glibc lossage.  You need to confiugre glibc with
--enable-static-nss, and then every binary that uses NSS must be
linked with '-lc -lnss_files -lnss_dns -lresolv' (in that order).

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
