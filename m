Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 51A3B482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 13:00:19 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16P7qa-0005du-00; Fri, 11 Jan 2002 20:00:16 +0000
Date: Fri, 11 Jan 2002 20:00:16 +0000
From: Matthew Wilcox <willy@debian.org>
To: Christian Suder <csuder@cisco.com>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] How to configure EISA network card in 715/80
Message-ID: <20020111200016.B20052@parcelfarce.linux.theplanet.co.uk>
References: <3C3F06DD.6050409@verizon.net> <20020111154337.D26644@parcelfarce.linux.theplanet.co.uk> <3C3F0DD1.4040508@verizon.net> <4.3.2.7.2.20020111113403.03f1b330@mira-sjc5-9.cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <4.3.2.7.2.20020111113403.03f1b330@mira-sjc5-9.cisco.com>; from csuder@cisco.com on Fri, Jan 11, 2002 at 11:38:02AM -0800
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

On Fri, Jan 11, 2002 at 11:38:02AM -0800, Christian Suder wrote:
> running newer kernels on a C110 with a NE1000 NIC. With 2.4.9-pa23 it works 
> nicely. Here is the output with a newer kernel 2.4.17-pa3 :
> Wax EISA Adapter found at 0xfc000000
> EISA: failed to claim EISA Bus address space!
> 
> Note the message in the last line !
> 
> Maybe that gives some hint what its going on,

This is a very different problem -- your machine at least finds the
EISA adapter.  I'm interesting in debugging it though; please send a
full dmesg to me in personal mail.

-- 
Revolutions do not require corporate support.
