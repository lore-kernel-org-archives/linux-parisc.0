Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 2 Feb 2003 21:11:22 -0700
To: "Aaron St. Pierre" <asp@ungod.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel compile
Message-ID: <20030203041122.GB29454@dsl2.external.hp.com>
References: <20030203020247.GB1046@hadron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030203020247.GB1046@hadron>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, Feb 02, 2003 at 09:02:47PM -0500, Aaron St. Pierre wrote:
> I took the config from 2.4.18-32
> and used that as my starting point for 2.4.20-pa23 

Can you:
# mv .config ../config-orig
# yes "" | make oldconfig
 (or something like that)

The default kernel should work on j2240.

grant

ps. FAQ has a link to "how to report kernel bugs"
	http://www.parisc-linux.org/faq/index.html#kernelbugreport
