Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E7D224829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Oct 2002 06:24:18 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17wiXz-0005p5-00; Wed, 02 Oct 2002 13:24:11 +0100
Date: Wed, 2 Oct 2002 13:24:11 +0100
From: Matthew Wilcox <willy@debian.org>
To: phi <phi@hpfrcu81.france.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] gcc and ++
Message-ID: <20021002132411.Z18377@parcelfarce.linux.theplanet.co.uk>
References: <20021002034059.34434.qmail@web12505.mail.yahoo.com> <3D9A94D3.8010009@itp.bg> <3D9AA07A.4B994F44@hpfrcu81.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D9AA07A.4B994F44@hpfrcu81.france.hp.com>; from phi@hpfrcu81.france.hp.com on Wed, Oct 02, 2002 at 09:30:03AM +0200
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

On Wed, Oct 02, 2002 at 09:30:03AM +0200, phi wrote:
> #define get_4(p) ( ((uint32)(*p++)<<24)| \
>                    ((uint32)(*p++)<<16)| \
>                    ((uint32)(*p++)<<8 )| \
>                    ((uint32)(*p++)) )

Undefined behaviour.  `|' is not a sequence point and you modify p more than
once.  How would this look?

#define get_4(p)	p += 4, (((uint32)p[-4] << 24) | \
			 ((uint32)p[-3] << 16) | \
			 ((uint32)p[-2] <<  8) | \
			 ((unit32)p[-1]))

comma _is_ a sequence point, so this is well-defined.

-- 
Revolutions do not require corporate support.
