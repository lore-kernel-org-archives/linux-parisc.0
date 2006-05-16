From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Next step in glibc test math failures analysis
	;
Date: Tue, 16 May 2006 10:28:45 -0400 (EDT)
Message-ID: <200605161428.k4GESjPE025534@hiauly1.hia.nrc.ca>
References: <IZD40G$E184A44107684D193BCA87FBC6894626@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IZD40G$E184A44107684D193BCA87FBC6894626@scarlet.be> from "Joel
	Soete" at May 16, 2006 04:24:16 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> pr #27627
> include the test case and the precompile stuff.

A simpler testcase is to simply print '__builtin_nanf("")' in hex.
This is totally independent of the parisc-linux implementation.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
