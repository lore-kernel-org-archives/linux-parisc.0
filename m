Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 20 Aug 2003 23:11:24 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030821051124.GB22498@dsl2.external.hp.com>
References: <20030815172142.GA19042@dsl2.external.hp.com> <F09536E0-CFFC-11D7-B685-000393581E44@speakeasy.net> <20030819050829.GF27208@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030819050829.GF27208@dsl2.external.hp.com>
Subject: [parisc-linux] Re: xchat colors
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

On Mon, Aug 18, 2003 at 11:08:29PM -0600, Grant Grundler wrote:
> I'll submit a patch to xchat so at least it checks the
> gdk return values and complains if it can't get the colors.

patch submitted to debian bug #200903.
IMHO a pathetic patch. If someone is looking for a very small
project, cleaning up xchat color handling would be a good thing.

I just realized that instead of xchat allocating it's own colors,
it might be nice to prompt the user to select from existing "default"
colors. And reduce the number of colors used overall by xchat.

grant
