From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] klibc parisc64
Date: Mon, 24 Jul 2006 15:35:46 -0400 (EDT)
Message-ID: <200607241935.k6OJZkNs000939@hiauly1.hia.nrc.ca>
References: <200607241901.k6OJ1aMN000440@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: klibc@zytor.com,
 parisc-linux@lists.parisc-linux.org,
 kyle@parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200607241901.k6OJ1aMN000440@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Jul 24, 2006 03:01:36 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > hppa64-linux-gnu-ld: usr/klibc/libc.so: Not enough room for program headers (allocated 5, need 6)

Additional phdrs are provided by elf64_hppa_additional_program_headers
in bfd/elf64-hppa.c.  The code doesn't expect a .interp section in
a shared library.  That would appear to be the problem here.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
