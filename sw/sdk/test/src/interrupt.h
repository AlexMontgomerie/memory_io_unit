/*
 * interrupt.h
 *
 *  Created on: 25 May 2018
 *      Author: juju
 */

#ifndef SRC_INTERRUPT_H_
#define SRC_INTERRUPT_H_

#include "xscugic.h"

extern XScuGic ScuGic;

int setupInterrupt();

#endif /* SRC_INTERRUPT_H_ */
