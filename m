From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Added clobbers to unaligned.c and uaccess.h
Date: Wed, 26 Apr 2006 12:12:00 -0400 (EDT)
Message-ID: <200604261612.k3QGC06P015157@hiauly1.hia.nrc.ca>
References: <IYBGWC$539A4DB29982C0998C1F16B221A06BBF@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 tsg45800@scarlet.be
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IYBGWC$539A4DB29982C0998C1F16B221A06BBF@scarlet.be> from "Joel
	Soete" at Apr 26, 2006 08:33:48 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>                 === gfortran Summary ===
> 
> # of expected passes            12718
> # of unexpected failures        2
> # of expected failures          14
> # of unsupported tests          96
> # of expected failures          12
> # of unsupported tests          315

Excellent.  All the complex fails are fixed.  I'll do a PR on the
two enum fails.

It would be great if you could generate a test summary with
contrib/test_summary and use the generated script to mail the
results to gcc-testresults@gcc.gnu.org.

Thanks,
Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
