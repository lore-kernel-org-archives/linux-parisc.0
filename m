Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8804F4840
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  2 Mar 2004 08:27:46 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AyBo8-00067B-UA; Tue, 02 Mar 2004 15:27:44 +0000
Date: Tue, 2 Mar 2004 15:27:44 +0000
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] glibc-2.3.3: a warning with gcc-3.3 become an
	error with gcc-3.5
Message-ID: <20040302152744.GH25779@parcelfarce.linux.theplanet.co.uk>
References: <20040301193815.GG21769@baldric.uwo.ca>
	<402A4CA50000D57D@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <402A4CA50000D57D@ocpmta2.freegates.net>
Sender: <willy@www.linux.org.uk>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Mar 02, 2004 at 03:59:34PM +0100, Joel Soete wrote:
> +  /* Raise the safed exception.  Incidently for us the implementation

"saved exception" or "safe exception"?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
