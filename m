From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: 2.6.14-rc2-pa2 ccio patch
Date: Tue, 11 Oct 2005 12:04:01 -0400 (EDT)
Message-ID: <200510111604.j9BG41Q7021242@hiauly1.hia.nrc.ca>
References: <IO7AYH$A873EF9A4A4D74961990E3C295F405D8@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: doko@debian.org,
 parisc-linux@lists.parisc-linux.org,
 james@nocrew.org,
 tsg45800@scarlet.be
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IO7AYH$A873EF9A4A4D74961990E3C295F405D8@scarlet.be> from "Joel
	Soete" at Oct 11, 2005 04:59:05 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> May I abuse of your presious time: I also recompile the kernel for a d380=
> 
> which uses ccio-dma in its term uses insn lci (see attached precompile .s=

I'll look at it.  As I recall, there wasn't much information about lha.
If lha and lci are the same, we should be using lci in the disassebly.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
