#!/usr/bin/env sh

k3d registry delete k3d-registry.localhost

k3d cluster delete mycluster