From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] ELF ABI Documents
Date: Wed, 19 Apr 2006 20:45:25 -0400 (EDT)
Message-ID: <200604200045.k3K0jPYV016350@hiauly1.hia.nrc.ca>
References: <1145324814.24150.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: jbailey@raspberryginger.com (Jeff Bailey)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1145324814.24150.12.camel@localhost.localdomain> from "Jeff
	Bailey" at Apr 17, 2006 09:46:54 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> It's most common in the LSB specs to refer to the ELF psabi document
> where possible.  http://refspecs.freestandards.org/elf/elf-pa.pdf seems

The latest version is here:
http://ftp.parisc-linux.org/docs/arch/elf-pa-hp.pdf

HP and Intel also developed a generic specification for the ELF-64 object
file format, and a version containing HP and HP-UX extensions.

> to be a copy of the psabi document, but when checking with some folks,
> it looks like the document isn't a reflection on reality for
> parisc-linux.  The question is, should the document be updated to
> reflect reality, should we slowly change to match the document, or
> should I just not refer to the psabi document much when writing the LSB
> document?

None of the above mentioned documents appear to contain a copyright
notice.  However, this may no longer be an absolute requirement under
US copyright law.  In as much as a linux document is likely going to
have to utilize material from the above, it probably would be wise to
get the written approval from HP before proceeding.  It might also be
necessary to get Intel's approval if the document also attempts to
specify ELF for 64-bit linux.  Of course if you just reference these
specifications and point out differences, this problem can be avoided.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
