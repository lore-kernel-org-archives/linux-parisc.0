Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3E7E4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Sep 2002 10:02:27 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17uEcL-0003y1-00; Wed, 25 Sep 2002 17:02:25 +0100
Date: Wed, 25 Sep 2002 17:02:25 +0100
From: Matthew Wilcox <willy@debian.org>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Failure when compile 2.4.19-pa20
Message-ID: <20020925170225.D25721@parcelfarce.linux.theplanet.co.uk>
References: <3D8F011400000BEB@ocpmta2.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D8F011400000BEB@ocpmta2.be.tiscali.com>; from jsoe0708@tiscali.be on Wed, Sep 25, 2002 at 05:56:08PM +0200
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

On Wed, Sep 25, 2002 at 05:56:08PM +0200, jsoe0708@tiscali.be wrote:
> I got USB part of .config from debian-configs/32 (I work on a b180) and try
> to compile 2.4.19-pa20 but it failled:

i'd guess you didn't select CONFIG_INPUT

-- 
Revolutions do not require corporate support.
