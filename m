Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 18 Dec 2002 09:58:13 -0700
To: jsoe0708@tiscali.be
Cc: Ed Schaller <schallee@darkmist.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] quad tulip now not functional in 2.4.20
Message-ID: <20021218165813.GA17944@dsl2.external.hp.com>
References: <20021216231132.GC854@dsl2.external.hp.com> <3DED9BBD0000213A@ocpmta7.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DED9BBD0000213A@ocpmta7.freegates.net>
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

On Tue, Dec 17, 2002 at 08:12:03AM +0100, jsoe0708@tiscali.be wrote:
> Just to avoid you loose time here is a diff:
...
> -	if (ee_data[27] == 0) {		/* No valid media table. */
> +	if (ee_data[27] == 0 || ee_data[ee_data[27]] == 0) {  /* No valid media
> table. */

Like I suspected, backing out this change made add-on boards work again.
I've reverted that change in 2.4.20-pa15 along with a traps.c change.
Please apply by hand and try the 4-port again.

thanks,
grant
