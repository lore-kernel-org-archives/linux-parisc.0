Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1E402482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Nov 2001 09:50:30 -0700 (MST)
Date: Thu, 22 Nov 2001 16:50:26 +0000
From: Richard Allen <ra@hp.is>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Mutexes ?
Message-ID: <20011122165026.D14821@hp.is>
References: <20011122103209.A1789@hp.is> <20011122152641.B10023@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011122152641.B10023@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Thu, Nov 22, 2001 at 03:26:41PM +0000
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

On Thu, Nov 22, 2001 at 03:26:41PM +0000, Matthew Wilcox wrote:
> On Thu, Nov 22, 2001 at 10:32:09AM +0000, Richard Allen wrote:
> > Is there a problem with threads and/os mutexes on parisc linux, or is it
> > just me ?
> > 
> > checking for mutexes... no
> > configure: WARNING: THREAD MUTEXES NOT AVAILABLE FOR THIS COMPILER/ARCHITECTURE.
> 
> what package?  many programs implement their own mutex support -- there's
> nothing wrong with the ones in glibc.

Its rpm 4.0.3.   The DB people think my crash problem in DB3 has something
to do with mutexes and looking at the output from configure Id say it
is a definate possibility.

-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.
