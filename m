Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B805482B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Nov 2001 11:11:12 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 161Agm-0007jW-00; Tue, 06 Nov 2001 18:11:08 +0000
Date: Tue, 6 Nov 2001 18:11:08 +0000
From: Matthew Wilcox <willy@debian.org>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: Albert Strasheim <fullung@ilink.nis.za>,
	kenneth westelinck <kennywest1@hotmail.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Compiling Mozilla on parisc-linux fails
Message-ID: <20011106181108.B27997@parcelfarce.linux.theplanet.co.uk>
References: <OE761L3gJcYPqd2rg2Q00007507@hotmail.com> <20011102140941.B17393@dogbert.localdomain> <fullung@ilink.nis.za> <20011106180434.D22C337DAD@carmen.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011106180434.D22C337DAD@carmen.fc.hp.com>; from taggart@carmen.fc.hp.com on Tue, Nov 06, 2001 at 11:04:34AM -0700
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

On Tue, Nov 06, 2001 at 11:04:34AM -0700, Matt Taggart wrote:
> DO NOT use the Sparc ones. I'm not even sure why they're available for hppa. 
> Just take the ones from cvs and put them in the right place. Someday we'll 
> have a kernel-headers package for hppa...

the only people needing kernel headers are people who build glibc.
there is no reason for anyone else to have them installed.

-- 
Revolutions do not require corporate support.
