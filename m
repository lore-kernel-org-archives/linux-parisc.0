Return-Path: <soete.joel@tiscali.be>
Received: from spoolo1.tiscali.be (spoolo1.tiscali.be [62.235.13.172])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6936C48C4
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 27 Mar 2004 15:43:49 -0700 (MST)
Message-ID: <406603A2.5080209@tiscali.be>
Date: Sat, 27 Mar 2004 22:43:46 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
References: <405D95D0.9030600@tiscali.be>
	<20040321195716.GC12455@colo.lackof.org>
	<20040323045151.GA6190@colo.lackof.org>
In-Reply-To: <20040323045151.GA6190@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: PA-RISC Linux Port <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello Grant,

Back to all with this pb

Grant Grundler wrote:
> On Sun, Mar 21, 2004 at 12:57:16PM -0700, Grant Grundler wrote:
> 
>>>Kernel Fault: Code=26 regs=10594380 (Addr=00000000)
>>
>>null ptr deref.
>>
>>...
>>
>>> IAOQ[0]: lasi700_probe+0x18c/0x1cc
>>> IAOQ[1]: lasi700_probe+0x190/0x1cc
>>> RP(r2): lasi700_probe+0x58/0x1cc
>>
>>IOAQ[0] is the offending instruction.

First of all this is my fault: for this b2k I used to compile the 2.6 kernel with b180 config :(
But I didn't notice that there was recently changes in this file.
To solve this pb I so had to add 'U2/Uturn I/O MMU' and also Zalon to make it bootable again (and finaly 'Lasi ethernet' to just 
have network access :) ).

> 
> 
> James Bottomley observed a problem with hppa_dma_ops
> not being set properly for his U2/Uturn box.
> This is likely the same problem.
> See ccio driver isn't claiming the chip when it should.
> 
That said, I am not able to link jejb with what I observe but here is the story.
The system boot but hang very quickly as soon as io rate increase as per a find of a file name :( (reproducible on request)
I then get mesg
arq->state 2
Badness in as_requeue_request at drivers/block/as-iosched.c:1479
Kernel addresses on the stack:
[snip]
[<10108c5c>] ret_from_kernel_thread+0x1c/0x24

I so added some printk as follow in  drivers/block/as-iosched.c
[snip]
static void as_requeue_request(request_queue_t *q, struct request *rq)
{
         struct as_data *ad = q->elevator.elevator_data;
         struct as_rq *arq = RQ_DATA(rq);

         if (arq) {
                 if (arq->state != AS_RQ_REMOVED) {
                         printk("arq->state %d\n", arq->state);
                         WARN_ON(1);
                 }

/* JSO */
                 printk("as_requeue_request will now set arq->state.\n");
/* JSO */
                 arq->state = AS_RQ_DISPATCHED;
/* JSO */
                 printk("as_requeue_request has just set arq->state.\n");
                 if (arq->io_context && arq->io_context->aic)
                         printk("as_requeue_request will now atomic_inc(&arq->io_context->aic->nr_dispatched).\n");
/* JSO */
                 if (arq->io_context && arq->io_context->aic)
                         atomic_inc(&arq->io_context->aic->nr_dispatched);
                 printk("finished if (arq).\n");
         } else
                 WARN_ON(blk_fs_request(rq)
                         && (!(rq->flags & (REQ_HARDBARRIER|REQ_SOFTBARRIER))) );

         printk("as_requeue_request will now list_add().\n");
         list_add(&rq->queuelist, ad->dispatch);
         printk("as_requeue_request has just list_add().\n");

         /* Stop anticipating - let this request get through */
         printk("as_requeue_request will now (as_antic_stop(%p)).\n", ad);
         as_antic_stop(ad);
         printk("as_requeue_request has just (as_antic_stop(%p)).\n", ad);
}
[snip]

And here is a sample of what I can grab from serial console when I trigger a find:
as_requeue_request will now set arq->state.
as_requeue_request has just set arq->state.
as_requeue_request will now atomic_inc(&arq->io_context->aic->nr_dispatched).
finished if (arq).
as_requeue_request will now list_add().
as_requeue_request has just list_add().
as_requeue_request will now (as_antic_stop(100b89a0)).
as_requeue_request has just (as_antic_stop(100b89a0)).
as_requeue_request will now set arq->state.
as_requeue_request has just set arq->state.
as_requeue_request will now atomic_inc(&arq->io_context->aic->nr_dispatched).
finished if (arq).
as_requeue_request will now list_add().
as_requeue_request has just list_add().
as_requeue_request will now (as_antic_stop(100b89a0)).
as_requeue_request has just (as_antic_stop(100b89a0)).
as_requeue_request will now set arq->state.
as_requeue_request has just set arq->state.
as_requeue_request will now atomic_inc(&arq->io_context->aic->nr_dispatched).
finished if (arq).
as_requeue_request will now list_add().
as_requeue_request has just list_add().
as_requeue_request will now (as_antic_stop(100b89a0)).
as_requeue_request has just (as_antic_stop(100b89a0)).
as_requeue_request will now set arq->state.
as_requeue_request has just set arq->state.
as_requeue_request will now atomic_inc(&arq->io_context->aic->nr_dispatched).
finished if (arq).
as_requeue_request will now list_add().
as_requeue_request has just list_add().
as_requeue_request will now (as_antic_stop(100b89a0)).
as_requeue_request has just (as_antic_stop(100b89a0)).
arq->state 2
Badness in as_requeue_request at drivers/block/as-iosched.c:1479
Kernel addresses on the stack:
  [<10124528>] printk+0x144/0x1c0
  [<101036bc>] dump_stack+0x18/0x24
  [<102276a0>] as_requeue_request+0x5c/0x17c
  [<1021e630>] elv_requeue_request+0x30/0x3c
  [<1023baf4>] scsi_request_fn+0x220/0x2bc
  [<1021e630>] elv_requeue_request+0x30/0x3c
  [<102212b8>] blk_insert_request+0xd8/0xf0
  [<1023a978>] scsi_queue_insert+0x6c/0xa0
  [<1023b7bc>] scsi_prep_fn+0xc4/0x1dc
  [<102368f8>] scsi_dispatch_cmd+0x118/0x22c
  [<1021e820>] elv_remove_request+0x34/0x44
  [<1023ba80>] scsi_request_fn+0x1ac/0x2bc
  [<102273f0>] as_next_request+0x44/0x54
  [<10228218>] as_work_handler+0x44/0x48
  [<101344e4>] worker_thread+0x1e4/0x280
  [<101200cc>] schedule+0x3f8/0x718
  [<101385f4>] kthread+0xdc/0xe4
  [<10108c5c>] ret_from_kernel_thread+0x1c/0x24

as_requeue_request will now set arq->state.
as_requeue_request has just set arq->state.
as_requeue_request will now atomic_inc(&arq->io_context->aic->nr_dispatched).
finished if (arq).
as_requeue_request will now list_add().
as_requeue_request has just list_add().
as_requeue_request will now (as_antic_stop(100b89a0)).
as_requeue_request has just (as_antic_stop(100b89a0)).

as_requeue_request will now set arq->state.
as_requeue_request has just set arq->state.
as_requeue_request will now atomic_inc(&arq->io_context->aic->nr_dispatched).
finished if (arq).
as_requeue_request will now list_add().
as_requeue_request has just list_add().
as_requeue_request will now (as_antic_stop(100b8aa0)).
as_requeue_request has just (as_antic_stop(100b8aa0)).
as_requeue_request will now set arq->state.
as_requeue_request has just set arq->state.
as_requeue_request will now atomic_inc(&arq->io_context->aic->nr_dispatched).
finished if (arq).
as_requeue_request will now list_add().
as_requeue_request has just list_add().
as_requeue_request will now (as_antic_stop(100b8aa0)).
as_requeue_request has just (as_antic_stop(100b8aa0)).
as_requeue_request will now set arq->state.
as_requeue_request has just set arq->state.
as_requeue_request will now atomic_inc(&arq->io_context->aic->nr_dispatched).
finished if (arq).
as_requeue_request will now list_add().
as_requeue_request has just list_add().
as_requeue_request will now (as_antic_stop(100b8aa0)).
as_requeue_request has just (as_antic_stop(100b8aa0)).
as_requeue_request will now set arq->state.
as_requeue_request has just set arq->state.
as_requeue_request will now atomic_inc(&arq->io_context->aic->nr_dispatched).
finished if (arq).
as_requeue_request will now list_add().
as_requeue_request has just list_add().
as_requeue_request will now (as_antic_stop(100b8aa0)).
as_requeue_request has just (as_antic_stop(100b8aa0)).
as_requeue_request will now set arq->state.
as_requeue_request has just set arq->state.
as_requeue_request will now atomic_inc(&arq->io_context->aic->nr_dispatched).
finished if (arq).
as_requeue_request will now list_add().
as_requeue_request has just list_add().
as_requeue_request will now (as_antic_stop(100b8aa0)).
as_requeue_request has just (as_antic_stop(100b8aa0)).
[snip]

it seems to be infinite loop :(

Any idea?

Thanks in advance,
     Joel
