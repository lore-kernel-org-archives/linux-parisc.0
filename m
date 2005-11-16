From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] experimental gcc-4.1 packages
Date: Wed, 16 Nov 2005 09:31:40 -0500 (EST)
Message-ID: <200511161431.jAGEVfxF010874@hiauly1.hia.nrc.ca>
References: <IQ1IVB$BE453CA6C7839293715E8E1912237425@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IQ1IVB$BE453CA6C7839293715E8E1912237425@scarlet.be> from "Joel
	Soete" at Nov 16, 2005 10:11:35 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Iirc jda is already aware of some dwarf pb (is it amoung?)

http://gcc.gnu.org/bugzilla/show_bug.cgi?id=24348.

I had asked Richard to install the generic part of the patch
referred to in the PR.  However, this hasn't happened yet.  I've
completed a patch to add dwarf2 exception support to the hpux
port.  I plan to submit it this evening.  Hopefully, this will
get things moving.

The patch includes a small change to the linux EH support.
Dynamic relocations are eliminated from the .eh_frame data.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
