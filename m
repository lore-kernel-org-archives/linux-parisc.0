From: "Helge Deller" <deller@gmx.de>
Subject: Aw: Re: [PATCH] aio: fix D-cache aliasing issues
Date: Mon, 18 Nov 2013 12:24:55 +0100 (CET)
Message-ID: <trinity-96b74089-565e-468c-a456-ac73dc4b097e-1384773895118@3capp-gmx-bs60>
References: <20131115220529.GA3160@ls3530.box>
 <1384555325.2003.39.camel@dabdike.int.hansenpartnership.com>
 <20131116200717.GA18939@schnuecks.de> <20131116200959.GA14098@kvack.org>
 <528933BC.50806@gmx.de>, <20131118105443.GA19633@schnuecks.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "Benjamin LaHaise" <bcrl@kvack.org>,
	"James Bottomley" <James.Bottomley@HansenPartnership.com>,
	linux-aio@kvack.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: "Simon Baatz" <gmbnomis@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131118105443.GA19633@schnuecks.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Hi Helge,
> Could you provide me with the test case(s) you are running to
> reproduce the problem?  I could test this on aliasing D-cache on ARM
> as well. Since kmap/kunmap do not flush in general on ARM, we
> might need the explicit flushes here.

Just google for aio-stress.c (e.g. https://github.com/repoforge/rpms/blob/master/specs/aio-stress/aio-stress.c).
And the aio01 / aio02 testcases from the Linux Test Project (https://github.com/linux-test-project/ltp).

Helge
