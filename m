Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C2B75485F
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Mar 2003 07:29:42 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.12)
	id 18t7Ee-0001av-00; Wed, 12 Mar 2003 14:29:36 +0000
Date: Wed, 12 Mar 2003 14:29:36 +0000
From: Matthew Wilcox <willy@debian.org>
To: Willian Ricardo <willian@mococasa.com.br>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PARISC hp 9000 model D 370
Message-ID: <20030312142936.GQ16414@parcelfarce.linux.theplanet.co.uk>
References: <008401c2e89a$13d85ef0$9632326e@wpires>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <008401c2e89a$13d85ef0$9632326e@wpires>
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

On Wed, Mar 12, 2003 at 10:19:57AM -0300, Willian Ricardo wrote:
> loading ramdisk 2663046 bytes@2fd65000...
> Branching to kernel entry point 0x0010000. If this the last
> Message you, you may need to switch you console . this is a common symptom -- search the FAQ and mailing at parisc-linux.org

Another possibility with the D class is that it has the Remote Management
card installed.  The kernel in Debian 3.0 doesn't support it; you have
to remove it.  Later kernels support it just fine, but you have to use
ttyB0 not ttyS0.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
