From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Support for 2.4.x kernels on hppa
Date: Mon, 24 May 2004 22:09:29 -0600
Message-ID: <20040525040929.GB1308__3666.58014613694$1416623454$gmane$org@colo.lackof.org>
References: <200405242136.i4OLaRtN003029@arbas.nms.ulrich-teichert.org>
	<200405242147.i4OLlVoZ012250@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Ulrich Teichert <krypton@ulrich-teichert.org>,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200405242147.i4OLlVoZ012250@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, May 24, 2004 at 05:47:31PM -0400, John David Anglin wrote:
> > Just make it clear in the release notes and let the compile fail on
> > 2.4 with an #error, IMHO. Does that sound too lazy ?-)
> 
> Yes.  It's a runtime issue and nobody seems to read the release notes.

In other words, the next Debian release based on gcc 3.5 or later
will require a 2.6 parisc kernel?

If that's the case, we are looking several years out and I personally
don't see a problem with it. Folks can continue to run "sarge"
for a long time after that if they are happy with it.

Gentoo folks will have to "pin" the compiler rev if they want
to use 2.4 kernels.

I trust we don't have to worry about HPUX, HP-RT, or MPE and
issues with gcc/java? :^)

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
