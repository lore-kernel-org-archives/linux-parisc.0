Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3E68E4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 13 Aug 2002 07:29:51 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17ebk6-00044Z-00; Tue, 13 Aug 2002 14:29:50 +0100
Date: Tue, 13 Aug 2002 14:29:49 +0100
From: Matthew Wilcox <willy@debian.org>
To: =?iso-8859-1?Q?Ant=F3nio_Ribeiro?= <antonio.ribeiro@kpnqwest.pt>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP9000/L2000 + FC60 Fiber Support
Message-ID: <20020813142949.R27578@parcelfarce.linux.theplanet.co.uk>
References: <002c01c242cc$a9f51cd0$a52efea9@kpnqwest.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <002c01c242cc$a9f51cd0$a52efea9@kpnqwest.com>; from antonio.ribeiro@kpnqwest.pt on Tue, Aug 13, 2002 at 02:23:49PM +0100
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

On Tue, Aug 13, 2002 at 02:23:49PM +0100, António Ribeiro wrote:
>     Fibre Channel: PCI device 103c:1028 (Hewlett-Packard Company) (rev 11).

according to the latest pci.ids, this is:
Tach TL Fibre Channel Host Adapter

hope this helps someone determine whether or not it's supported.

-- 
Revolutions do not require corporate support.
