Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id D68474829
	for <parisc-linux@parisc-linux.org>; Fri, 27 Jun 2003 10:21:40 -0600 (MDT)
Date: Fri, 27 Jun 2003 18:21:37 +0200
Message-ID: <3ED70CF10000AE35@ocpmta2.freegates.net>
In-Reply-To: <20030626170628.GO451@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] warning: minor abi change
To: "Matthew Wilcox" <willy@debian.org>,
	"Alan Cox" <alan@lxorguk.ukuu.org.uk>
Cc: "Matthew Wilcox" <willy@debian.org>,
	parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Too bad in 2.4.22-pre2:

diff -urN linux-2.4.22-pre1/include/linux/sysctl.h linux-2.4.22-pre2/include/linux/sysctl.h
--- linux-2.4.22-pre1/include/linux/sysctl.h	2003-06-13 07:51:39.000000000
-0700
+++ linux-2.4.22-pre2/include/linux/sysctl.h	2003-06-26 15:02:23.000000000
-0700
@@ -125,6 +125,7 @@
 	KERN_TAINTED=53,	/* int: various kernel tainted flags */
 	KERN_CADPID=54,		/* int: PID of the process to notify on CAD */
  	KERN_CORE_PATTERN=56,	/* string: pattern for core-files */
+	KERN_PPC_L3CR=57,       /* l3cr register on PPC */
 };
 
 
which interfere with your:
 	KERN_HPPA_PWRSW=57,	/* int: hppa soft-power enable */
 	KERN_HPPA_UNALIGNED=58,	/* int: hppa unaligned-trap enable */
};

What to do?

Thanks,
    Joel


---------------------------------
Tiscali ADSL: 19,50 euros/mois...abonnez-vous sur www.tiscali.be
