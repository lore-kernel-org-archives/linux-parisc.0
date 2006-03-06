From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] alternate insn for parisc (ccio/sba)
Date: Mon, 6 Mar 2006 10:07:29 -0700
Message-ID: <20060306170729.GB21702@colo.lackof.org>
References: <20060303201428.GA25283@quicksilver.road.mcmartin.ca>
	<20060304003802.GB18473@colo.lackof.org>
	<440907C5.7050503@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <440907C5.7050503@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Mar 04, 2006 at 11:21:41AM +0800, Randolph Chung wrote:
> Just my 2 cents, but unless it is code that is performance critical and
> we can demonstrate a significant difference on a particular measurement,
> and it is not something that can be determined at compile time, I think
> we should do runtime code patching sparingly. If nothing else, it makes
> the code harder to read and perhaps to debug.

Agreed. I was just stretching a bit to find an example.

cheers,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
