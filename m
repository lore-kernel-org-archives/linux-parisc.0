Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 4 Jul 2003 19:03:41 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] binutils_2.14.90 bug
Message-ID: <20030705010341.GA16038@dsl2.external.hp.com>
References: <20030704191042.GB7885@dsl2.external.hp.com> <200307041929.h64JTbD5020079@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200307041929.h64JTbD5020079@hiauly1.hia.nrc.ca>
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

On Fri, Jul 04, 2003 at 03:29:36PM -0400, John David Anglin wrote:
> Hi Grant,
> 
> Due to an "improvement" made for the detection of labels on ia64,
> the PA assembler no longer tolerants whitespace in the operand field.
> The only whitespace that is allowed is after `,'.  So, you need to
> remove the whitespace around `+' and `*'.  If you look at the HP
> assembler docs, you will see that they never show any whitespace
> in the operands field.

ok. I can fix that. thanks!

grant
