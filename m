From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] TLS added relocations.
Date: Tue, 5 Apr 2005 12:34:01 -0400
Message-ID: <20050405163400.GN1833@baldric.uwo.ca>
References: <20050405161549.GM1833@baldric.uwo.ca>
	<20050405162643.GB6987@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050405162643.GB6987@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Apr 05, 2005 at 09:26:43AM -0700, Randolph Chung wrote:
> > Is DTPMOD32 and DTPOFF32 all I need to add to glibc for some initial TLS
> > testing?
> 
> Well, plus the setting up of the THREAD_DTV() stuff.

Oh, and TPREL32.
 
> > Recommended tests to make sure this is working?
> 
> I haven't really looked, but glibc has a bunch of TLS tests. It'll also
> pretty easy to write our own test cases. 

I can't turn that machinery on yet. I have to test with TLS off but
handling the relocations first to see if it works :)

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
