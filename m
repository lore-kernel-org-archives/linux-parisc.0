From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: ncr53c8xx patch for c110
Date: Sun, 20 Jun 2004 01:28:52 -0600
Message-ID: <20040620072852.GC18353@colo.lackof.org>
References: <40BD9F8700009BB8@ocpmta2.freegates.net>
	<1087569206.2078.13.camel@mulgrave>
	<40D30E3C.1010809@tiscali.be> <40D34A27.8060009@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40D34A27.8060009@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jun 18, 2004 at 08:01:43PM +0000, Joel Soete wrote:
> And all works fine now for me. Unfortunately I don't have other model (C, 
> D, R, J or K) using the same driver to test it more :(
> 
> I don't have any cvs ci access, so if there are no negative feedback can 
> somebody ci.

James owns this. I'll commit it if he tells me it's ok.

I didn't fully review this patch because of extra white space
changes like this one:

> -	struct scr_tblmove data [MAX_SCATTER];
> +	struct scr_tblmove data[MAX_SCATTER];

Not a reason to reject the patch. but it would be nice
if you submitted white space edits seperately.

> PS: I just noticed that this cut&past didn't respect my patch tabs (became 
> 8 space) so I attache also the original diff file (sorry for inconvenience

cut/paste almost nevery works.
Use an editor which can inline the patch file and sends mail
as plain/text. plain/text attachments work for me though it's
preferable to inline the patch.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
