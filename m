Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B7F0482C
	for <parisc-linux@parisc-linux.org>; Tue, 13 Nov 2001 07:25:52 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 163eVV-0001vX-00; Tue, 13 Nov 2001 14:25:45 +0000
Date: Tue, 13 Nov 2001 14:25:45 +0000
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] to swap or not to swap
Message-ID: <20011113142545.E11817@parcelfarce.linux.theplanet.co.uk>
References: <20011113003057.H391@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011113003057.H391@tausq.org>; from randolph@tausq.org on Tue, Nov 13, 2001 at 12:30:57AM -0800
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

On Tue, Nov 13, 2001 at 12:30:57AM -0800, Randolph Chung wrote:
> Can someone please explain this to me?
> 
> It looks like some BE architectures define {read,write}[wl] to do LE swapping 
> (sparc, mipsel, ppc, etc) but others don't (s390, parisc). What is the 
> "correct" behavior?
> 
> The inX/outX interfaces are all internal-swapped to LE.

depends on the PCI bridge and MMU whether you need to do bytesexswapping
in software or not.  see section 9 in the Dino ERS, page 61 for how PA
does this.

-- 
Revolutions do not require corporate support.
