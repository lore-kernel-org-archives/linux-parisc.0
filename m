Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8592F4E32
	for <parisc-linux@lists.parisc-linux.org>;
	Thu,  8 Apr 2004 06:36:59 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i38Caoa12045; Thu, 8 Apr 2004 08:36:50 -0400
Subject: RE: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
From: James Bottomley <James.Bottomley@steeleye.com>
To: Joel Soete <soete.joel@tiscali.be>
In-Reply-To: <40711E55000025BC@ocpmta2.freegates.net>
References: <40711E55000025BC@ocpmta2.freegates.net>
Content-Type: text/plain
Date: 08 Apr 2004 07:36:22 -0500
Message-Id: <1081427783.2105.6.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, 2004-04-08 at 01:15, Joel Soete wrote:
> Now as far as remember .h files are headers and so should only contains declaration
> of function and not their definition excepted if they are very short  (imho
> 3 line max) but that is a personal limit: does it exist a common agreement
> on this limit? 
> And here why changing translation_exists() definition location?

Because it's an inline function.  To move an inline function to a place
shareable by other files it has to go into a header.

James
