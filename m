From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Let's Try Something New(tm)
Date: Sat, 17 Feb 2007 16:59:00 -0500
Message-ID: <20070217215900.GG2880__852.729756343429$1416624292$gmane$org@athena.road.mcmartin.ca>
References: <20070217064648.GA2880@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070217064648.GA2880@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Feb 17, 2007 at 01:46:48AM -0500, kyle mcmartin wrote:
> 1: Frankly I find this shared git tree thing to be a huge waste of my time,
>    we're no better off than we were with CVS...
> 

There was a question on why, so here goes,

Currently, the shared git tree is permanently divergent from the Linus tree.
Because Linus never merges from this tree, it is impossible to ever see what
changesets remain outstanding, since the changesets which are merged come
>from the second tree.

(kyle)                       --o--o--o--o--o----o
                            /                    \
(linus) --o--o--o--o--o--o-----o--o--o--o--o--o---X--o--o--
                             \
(parisc) --o--o--o--o--o--o---X---o--o--o--o--o--o

Where 'X' is a pull from the other tree into the X'd tree.

Anyway, the idea is to reduce this to one tree so there will be back and
forth pulling from the same tree, making it really easy to see which
long-term patches are still outstanding from the noise of the fast-moving
patches.

Or something.
	-- Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
