Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 301274856
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 16 Feb 2004 10:47:55 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AsmqX-000741-Rf; Mon, 16 Feb 2004 17:47:53 +0000
Date: Mon, 16 Feb 2004 17:47:53 +0000
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] hw db pb?
Message-ID: <20040216174753.GM31168@parcelfarce.linux.theplanet.co.uk>
References: <402A4CA5000034AF@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <402A4CA5000034AF@ocpmta2.freegates.net>
Sender: <willy@www.linux.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Feb 16, 2004 at 06:42:17PM +0100, Joel Soete wrote:
> Hi all,
> 
> I try to have a look on D380 cpu's type into:
> <http://hwdb.parisc-linux.org/>
> 
> but I only get severall:
> "Warning: MySQL Connection Failed: Can't connect to local MySQL server through
> socket '/var/run/mysqld/mysqld.sock' (111) in ../database.php3 on line 19

mysqld had died.  I just restarted it and it now works for me.  Thanks for
the report.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
