Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id F1BB3482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Apr 2002 07:44:31 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16tUx3-0007Xq-00; Fri, 05 Apr 2002 15:44:29 +0100
Date: Fri, 5 Apr 2002 15:44:29 +0100
From: Matthew Wilcox <willy@debian.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: Jesus Climent <climent@stybba.ntc.nokia.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 64bit newbie question
Message-ID: <20020405154429.F27682@parcelfarce.linux.theplanet.co.uk>
References: <20020405135556.GO10207@shire.ntc.nokia.com> <Pine.LNX.4.44.0204051456300.28325-100000@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0204051456300.28325-100000@sal.ucc.ie>; from xam@cs.ucc.ie on Fri, Apr 05, 2002 at 02:59:34PM +0100
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

On Fri, Apr 05, 2002 at 02:59:34PM +0100, M. Grabert wrote:
> I wondered what options I have to pass to gcc to created 64bit
> executables (e.g. a 64bit kernel), and/or whether the 'normal' gcc-3.0
> you get with apt-get is just capable of dealing with 32bit executables.

nobody's made gcc support both 32 and 64 bit targets yet on hppa.  for now,
install the obvious debs from http://ftp.parisc-linux.org/unofficial-debs/

-- 
Revolutions do not require corporate support.
